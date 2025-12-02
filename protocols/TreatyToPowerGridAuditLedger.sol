// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPowerGridAuditLedger {
    string public batchID = "1321.9.239";
    string public steward = "Vinvin";

    address public admin;

    struct Grid {
        string region;     // Luzon, Visayas, Mindanao
        string status;     // audited, pending, ghost
        uint256 timestamp;
    }

    Grid[] public grids;

    event GridLogged(string region, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logGrid(string memory region, string memory status) public onlyAdmin {
        grids.push(Grid(region, status, block.timestamp));
        emit GridLogged(region, status);
    }

    function getGrid(uint256 index) public view returns (string memory region, string memory status, uint256 timestamp) {
        Grid memory g = grids[index];
        return (g.region, g.status, g.timestamp);
    }
}
