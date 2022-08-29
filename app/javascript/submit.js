window.addEventListener('DOMContentLoaded', function(){
  $( '#submit-btn' ).prop( 'disabled', true );
  
  $('#q_brand_id_eq').on('change', function(){
      
      const selected = $('#q_category_id_eq').val();
      if( selected !== '' ){
          $('#submit-btn').prop('disabled', false);
      } else {
          $('#submit-btn').prop('disabled', true);
      }
  })
  });