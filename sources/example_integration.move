module depends_on_thalaswap::example_integration {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use thalaswap::base_pool::Null;
    use thalaswap::weighted_pool::{Self, Weight_50};
    use Layerzero::asset::USDC;
    
    public entry fun swap_apt_to_usdc(account: &signer, amount_in: u64) {
        let in = coin::withdraw<AptosCoin>(account, amount_in);
        let out = weighted_pool::swap_exact_in<USDC, AptosCoin, Null, Null, Weight_50, Weight_50, Null, Null, AptosCoin, USDC>(in);
        coin::deposit(signer::address_of(account), out);
    }
}