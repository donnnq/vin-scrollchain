// SPDX-License-Identifier: Mythic-Defense
pragma solidity ^0.8.19;

contract SatelliteDefenseInvestment {
    address public steward;
    uint256 public totalInvestment;
    mapping(string => uint256) public tacticFund;
    mapping(string => bool) public satelliteShielded;

    event InvestmentLogged(string tactic, uint256 amount);
    event SatelliteShielded(string name, bool status);

    constructor() {
        steward = msg.sender;
    }

    function investInTactic(string memory tactic, uint256 amount) public {
        require(msg.sender == steward, "Only steward may invest");
        tacticFund[tactic] += amount;
        totalInvestment += amount;
        emit InvestmentLogged(tactic, amount);
    }

    function shieldSatellite(string memory name) public {
        require(msg.sender == steward, "Only steward may shield");
        satelliteShielded[name] = true;
        emit SatelliteShielded(name, true);
    }
}
