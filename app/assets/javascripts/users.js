function toggleUserStatus(user_id) {
  $.ajax({url: `users/${user_id}/toggle_user_status`});
}