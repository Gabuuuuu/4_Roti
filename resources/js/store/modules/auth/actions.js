export default {
    async login(context, payload) {
        return context.dispatch('auth', {
            ...payload,
            mode: 'login'
        });
    },
    async signup(context, payload) {
        return context.dispatch('auth', {
            ...payload,
            mode: 'signup'
        });
    },
    async auth(context, credentials) {
        await axios.get('/sanctum/csrf-cookie')

        let url = credentials.mode === 'signup' ? '/api/register' : '/api/login';

        const response = await axios.post(url, credentials, {
            withCredentials: true,
        });

        const responseData = await response.data;

        if(!response.statusText) {
            const error = new Error(
                responseData.message || 'Failed to authenticate. Check your credentials.'
            );
            throw error;
        }

        const access_token = responseData.access_token;
        const id = responseData.id;
        let roleData = [];

        localStorage.setItem("token", access_token);
        localStorage.setItem("user_id", id);

        axios.get(`api/users/getRole/${id}`).then((data) =>
        {
            const newRoleData = JSON.stringify(data.data);
            setRoleData(newRoleData);
            localStorage.setItem('roleData', newRoleData);
        });

        const setRoleData = (data) => {
            roleData = data;

            context.commit('setUser', {
                token: access_token,
                user_id: id,
                roleData: roleData
            });
        }
    },
    logout(context) {
        localStorage.removeItem("token");
        localStorage.removeItem("user_id");
        localStorage.removeItem("roleData");

        context.commit("setUser", {
            token: null,
            userId: null,
            roleData: [],
        });

        context.commit("setUser", false);

        axios.get("api/logout");
    },
};
