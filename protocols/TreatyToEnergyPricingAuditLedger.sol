// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToEnergyPricingAuditLedger {
    string public batchID = "1321.9.208";
    string public steward = "Vinvin";

    address public admin;

    struct Pricing {
        string utility;     // electricity, LPG, fuel
        uint256 rate;       // price per kWh or unit
        string status;      // verified, pending, ghost
        uint256 timestamp;
    }

    Pricing[] public pricings;

    event PricingLogged(string utility, uint256 rate, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPricing(string memory utility, uint256 rate, string memory status) public onlyAdmin {
        pricings.push(Pricing(utility, rate, status, block.timestamp));
        emit PricingLogged(utility, rate, status);
    }

    function getPricing(uint256 index) public view returns (string memory utility, uint256 rate, string memory status, uint256 timestamp) {
        Pricing memory p = pricings[index];
        return (p.utility, p.rate, p.status, p.timestamp);
    }
}
