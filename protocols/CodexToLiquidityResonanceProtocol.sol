// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToLiquidityResonanceProtocol {
    string public batchID = "1321.9.115";
    string public steward = "Vinvin";

    address public admin;

    struct Resonance {
        string sector;
        string impact;
        uint256 timestamp;
    }

    Resonance[] public records;

    event ResonanceLogged(string sector, string impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logResonance(string memory sector, string memory impact) public onlyAdmin {
        records.push(Resonance(sector, impact, block.timestamp));
        emit ResonanceLogged(sector, impact);
    }

    function getResonance(uint256 index) public view returns (string memory sector, string memory impact, uint256 timestamp) {
        Resonance memory r = records[index];
        return (r.sector, r.impact, r.timestamp);
    }
}
