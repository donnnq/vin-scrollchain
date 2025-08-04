// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinCongressCheck {
    mapping(address => bool) public congressWallets;
    address public registrar;

    event WalletRegistered(address indexed wallet);
    event AffiliationChecked(address indexed wallet, bool isAffiliated);

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "Not authorized");
        _;
    }

    constructor() {
        registrar = msg.sender;
    }

    function registerCongressWallet(address _wallet) external onlyRegistrar {
        congressWallets[_wallet] = true;
        emit WalletRegistered(_wallet);
    }

    function checkAffiliation(address _wallet) external view returns (bool) {
        bool affiliated = congressWallets[_wallet];
        emit AffiliationChecked(_wallet, affiliated);
        return affiliated;
    }
}
