// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToHumanitarianAidDistributionGrid {
    string public batchID = "1321.9.104";
    string public steward = "Vinvin";

    address public admin;

    struct AidPackage {
        uint256 amount;
        string sector; // healthcare, housing, education
        uint256 timestamp;
        bool released;
    }

    mapping(bytes32 => AidPackage) public aidRegistry;

    event AidReleased(bytes32 indexed key, uint256 amount, string sector);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function releaseAid(uint256 amount, string memory sector) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(amount, sector, block.timestamp));
        aidRegistry[key] = AidPackage(amount, sector, block.timestamp, true);
        emit AidReleased(key, amount, sector);
    }

    function getAid(bytes32 key) public view returns (uint256 amount, string memory sector, uint256 timestamp, bool released) {
        AidPackage memory a = aidRegistry[key];
        return (a.amount, a.sector, a.timestamp, a.released);
    }
}
