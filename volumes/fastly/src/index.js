async function handleRequest(event) {
  let request, response, client

  try {
    client = event.client
    request = event.request

    response = await fetch(request, {
      backend: 'apache',
      headers: request.headers,
    })

    return response
  } catch {
    return response
  }
}

addEventListener("fetch", (event) => event.respondWith(handleRequest(event)))
