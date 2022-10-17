export default {
    userId(state) {
        return state.userId;
    },
    userName(state) {
        return state.userName;
    },
    token(state) {
        return state.token;
    },
    isAuthenticated(state) {
        return !!state.token;
    },
    retrieveRoleData(state){
        return state.roleData;
    },
}