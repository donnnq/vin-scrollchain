// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToReconstructionProjectTrackingGrid {
    string public batchID = "1321.9.106";
    string public steward = "Vinvin";

    address public admin;

    struct Project {
        string name;
        string sector; // healthcare, housing, education, energy
        uint256 budget;
        uint256 timestamp;
        bool active;
    }

    mapping(bytes32 => Project) public projectRegistry;

    event ProjectLogged(bytes32 indexed key, string name, string sector, uint256 budget);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logProject(string memory name, string memory sector, uint256 budget) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(name, sector, budget, block.timestamp));
        projectRegistry[key] = Project(name, sector, budget, block.timestamp, true);
        emit ProjectLogged(key, name, sector, budget);
    }

    function getProject(bytes32 key) public view returns (string memory name, string memory sector, uint256 budget, uint256 timestamp, bool active) {
        Project memory p = projectRegistry[key];
        return (p.name, p.sector, p.budget, p.timestamp, p.active);
    }
}
