export default {
    setUser(state, payload) {
        state.token = payload.token;
        state.userId = payload.user_id;
        state.roleData = payload.roleData;
    },
    setToken(state, payload) {
        state.token = payload.token;
    },
    setUsername(state, payload) {
        state.userName = payload.username;
    },
    setRole(state, payload) {
        state.userRole = payload.name;
    },
    removeRole(state) {
        state.userRole = null;
    },
    loginVerify(state) {
        const storeToken = localStorage.getItem("token");
        const storeUser = localStorage.getItem("user_id");
        const storeRoleData = localStorage.getItem("roleData");

        if (storeToken) {
            state.token = storeToken;
            state.userId = storeUser;
            state.roleData = storeRoleData;
            state.isAuthenticated = true;

            return true;
        } else {
            return false;
        }
    },
};
