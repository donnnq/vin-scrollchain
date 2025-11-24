// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToTaxEquityRedistributionGrid {
    string public batchID = "1321.9.115";
    string public steward = "Vinvin";

    address public admin;

    struct Redistribution {
        uint256 amount;
        string sector; // education, healthcare, resilience
        uint256 timestamp;
        bool executed;
    }

    mapping(bytes32 => Redistribution) public redistributionRegistry;

    event RedistributionExecuted(bytes32 indexed key, uint256 amount, string sector);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function executeRedistribution(uint256 amount, string memory sector) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(amount, sector, block.timestamp));
        redistributionRegistry[key] = Redistribution(amount, sector, block.timestamp, true);
        emit RedistributionExecuted(key, amount, sector);
    }

    function getRedistribution(bytes32 key) public view returns (uint256 amount, string memory sector, uint256 timestamp, bool executed) {
        Redistribution memory r = redistributionRegistry[key];
        return (r.amount, r.sector, r.timestamp, r.executed);
    }
}
