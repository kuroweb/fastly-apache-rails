const disableDownstreamCache = () => {
  response.headers.set('cache-control', 'max-age=0, no-cache, no-store')
  response.headers.set('pragma', 'no-cache')
  const date = response.headers.get('date')
  if (date) {
    response.headers.set('expires', date)
  }
  response.headers.delete('age')
}

handleRequest = async (event) => {
  let request, response, client

  try {
    client = event.client
    request = event.request

    response = await fetch(request, {
      backend: 'apache',
      headers: request.headers,
    })

    disableDownstreamCache(response)

    return response
  } catch {
    return response
  }
}

addEventListener("fetch", (event) => event.respondWith(handleRequest(event)))
