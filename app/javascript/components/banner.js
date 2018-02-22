import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.getElementById('sweet-alert-demo').addEventListener('click', () => {
    swal({
      title: "Confirmation",
      text: "The booking has been sucessfully deleted",
      icon: "success"
    })
  });
}

export { bindSweetAlertButtonDemo };
