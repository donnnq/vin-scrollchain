// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BuyerOnboardingProtocolDAO {
    address public admin;

    struct Buyer {
        address wallet;
        bool verified;
        string onboardingStage;
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
        buyers[_wallet] = Buyer(_wallet, true, "Application Submitted");
    }

    function updateStage(address _wallet, string memory _stage) external onlyAdmin {
        require(buyers[_wallet].verified, "Buyer not verified");
        buyers[_wallet].onboardingStage = _stage;
    }

    function getStage(address _wallet) external view returns (string memory) {
        return buyers[_wallet].onboardingStage;
    }
}
