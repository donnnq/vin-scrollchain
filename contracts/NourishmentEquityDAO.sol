// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NourishmentEquityDAO {
    address public admin;

    struct EquityGrant {
        string region;
        string foodType;
        uint256 grantAmount;
        bool disbursed;
    }

    EquityGrant[] public grants;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeGrant(string memory _region, string memory _foodType, uint256 _grantAmount) external onlyAdmin {
        grants.push(EquityGrant(_region, _foodType, _grantAmount, false));
    }

    function disburseGrant(uint256 index) external onlyAdmin {
        grants[index].disbursed = true;
    }

    function getGrant(uint256 index) external view returns (EquityGrant memory) {
        return grants[index];
    }
}
