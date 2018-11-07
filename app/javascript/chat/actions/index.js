const BASE_URL = '/api/v1/channels';
const csrfToken = document.querySelector('meta[name="csrf-token"]').attributes.content.value;

export const FETCH_MESSAGES = 'FETCH_MESSAGES';
export const MESSAGE_POSTED = 'MESSAGE_POSTED';

export function fetchMessages(channel) {
  const url = `${BASE_URL}/${channel}/messages`;
  const promise = fetch(url, { credentials: "same-origin" }).then(r => r.json());

  return {
    type: FETCH_MESSAGES,
    payload: promise // Will be resolved by redux-promise
  };
}

export function createMessage(content, channel) {
  const url = `${BASE_URL}/${channel}/messages`;
  const promise = fetch(url, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
       'X-CSRF-Token': csrfToken
    },
    credentials: "same-origin",
    body: JSON.stringify({content: content})
  }).then(r => r.json());

  return {
    type: MESSAGE_POSTED,
    payload: promise // Will be resolved by redux-promise
  };
}
