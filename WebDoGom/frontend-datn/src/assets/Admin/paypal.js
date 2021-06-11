var pp = document.getElementById("paypalcheckout").value;
console.log(pp);
paypal.Button.render({
    env: 'sandbox',
    client: {
      sandbox: 'AZke2y8dxpaipKpMAbmu__PZuF3_dg0m1ksHMBuicmuMkYzEhrmoLewWcDRGnA5bzo4KfMnCLUa4BmmH',
      production: 'demo_production_client_id'
    },
    locale: 'en_US',
    style: {
      size: 'large',
      color: 'gold',
      shape: 'pill',
    },
    // Enable Pay Now checkout flow (optional)
    commit: true,
    // Set up a payment
    payment: function(data, actions) {
     
      return actions.payment.create({
        transactions: [{
          amount: {
            // total:pp,
            total: '1',
            currency: 'USD'
          }
        }]
      });
    },
    // Execute the payment
    onAuthorize: function(data, actions) {
      return actions.payment.execute().then(function() {
        // Show a confirmation message to the buyer
        window.alert('Thank you for your purchase!');
      });
    }
  }, '#paypal-button');