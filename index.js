const btn = document.getElementById('btn');

btn.addEventListener('click', function onClick() {
    const url='https://176.9.11.219:8443/v1/dev/data/showrooms';
    //const url='http://176.9.11.219:8001/v1/dev/data/showrooms';
    fetch(url, {
        method: 'GET', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'omit', // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
    }).then(response => response.json())
        .then(json => console.log(json))
        .catch(err => console.error(err));
});


