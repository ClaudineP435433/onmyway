import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.getElementById('sweet-alert-demo').addEventListener('click', () => {
    swal({
      title: "Confirmation",
      text: "Thank you for this delivery"
      icon: "success"
    })
  });
}

export { bindSweetAlertButtonDemo };
