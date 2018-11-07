import { FETCH_MESSAGES, MESSAGE_POSTED } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_MESSAGES:
      return action.payload;
    case MESSAGE_POSTED:
      return state;
    default:
      return state;
  }
}
