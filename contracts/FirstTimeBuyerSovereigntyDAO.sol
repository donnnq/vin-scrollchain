// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FirstTimeBuyerSovereigntyDAO {
    address public admin;

    struct Buyer {
        address wallet;
        bool verified;
        uint256 assistanceReceived;
    }

    mapping(address => Buyer) public buyers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function verifyBuyer(address _wallet) external onlyAdmin {
        buyers[_wallet] = Buyer(_wallet, true, 0);
    }

    function requestAssistance(address _wallet, uint256 _amount) external {
        require(buyers[_wallet].verified, "Buyer not verified");
        buyers[_wallet].assistanceReceived += _amount;
        payable(_wallet).transfer(_amount);
    }
}
