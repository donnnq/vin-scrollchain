// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToPublicServiceLiberationGrid {
    string public batchID = "1321.9.116";
    string public steward = "Vinvin";

    address public admin;

    struct Service {
        string sector; // healthcare, education, housing
        uint256 allocation;
        uint256 timestamp;
        bool active;
    }

    mapping(bytes32 => Service) public services;

    event ServiceLiberated(bytes32 indexed key, string sector, uint256 allocation);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function liberateService(string memory sector, uint256 allocation) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(sector, allocation, block.timestamp));
        services[key] = Service(sector, allocation, block.timestamp, true);
        emit ServiceLiberated(key, sector, allocation);
    }

    function getService(bytes32 key) public view returns (string memory sector, uint256 allocation, uint256 timestamp, bool active) {
        Service memory s = services[key];
        return (s.sector, s.allocation, s.timestamp, s.active);
    }
}
