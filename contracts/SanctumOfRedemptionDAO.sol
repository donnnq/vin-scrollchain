// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumOfRedemptionDAO {
    address public admin;

    struct Redemption {
        string name;
        string sanctum;
        string ritual;
        bool completed;
    }

    Redemption[] public redemptions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateRedemption(string memory _name, string memory _sanctum, string memory _ritual) external onlyAdmin {
        redemptions.push(Redemption(_name, _sanctum, _ritual, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        redemptions[index].completed = true;
    }

    function getRedemption(uint256 index) external view returns (Redemption memory) {
        return redemptions[index];
    }
}
