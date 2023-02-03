export const OPEN_SESSION = 'session/OPEN_SESSION'

function createSession(user){
    return {
        type: OPEN_SESSION,
        user
    }
}



