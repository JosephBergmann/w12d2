import {createStore, combineReducers, applyMiddleware, compose} from 'redux'

import thunk from 'redux-thunk'

function rootReducer(){
    combineReducers({})
}

let enhancer;

if(process.env.NODE_ENV === 'production'){
    enhancer = applyMiddleware(thunk);
} else {
    const logger = require('redux-logger').default;
}