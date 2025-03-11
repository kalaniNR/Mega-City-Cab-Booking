function addToCart(id, name, price) {
    let form = document.createElement("form");
    form.method = "post";
    form.action = "CartServlet";

    let fields = { id, name, price };
    for (let key in fields) {
        let input = document.createElement("input");
        input.type = "hidden";
        input.name = key;
        input.value = fields[key];
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
}
