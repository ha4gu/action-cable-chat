//= require infinite-scroll.pkgd.min

document.addEventListener('DOMContentLoaded', () => {
  const inputarea = document.getElementById('new_post_input');
  inputarea.focus();
  inputarea.addEventListener('keypress', (event) => {
    if (event.key === 'Enter') {
      if (event.target.value !== '') {
        App.chat.speak(event.target.value);
        event.target.value = '';
      };
      event.preventDefault();
    };
  });
  var infScroll = new InfiniteScroll( '#room_posts', {
    // options
    path: 'nav.pagination a[rel=next]',
    append: 'p.single_post',
    prefill: true,
    history: false,
    hideNav: '.pagination',
    status: '#page-load-status',
  });
})
