// SPDX-License-Identifier: Soul-Registry
pragma solidity ^0.8.19;

contract vinSoulHashRegistry {
    address public registrar;

    struct SoulMark {
        string entityName;
        bytes32 soulHash;
        string deedDetails;
        uint256 timestamp;
    }

    SoulMark[] public registry;

    event SoulMarked(string entityName, bytes32 soulHash, string deedDetails);

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "Unauthorized soul registry access");
        _;
    }

    constructor() {
        registrar = msg.sender;
    }

    function markSoul(
        string calldata entityName,
        bytes32 soulHash,
        string calldata deedDetails
    ) external onlyRegistrar {
        SoulMark memory mark = SoulMark(entityName, soulHash, deedDetails, block.timestamp);
        registry.push(mark);
        emit SoulMarked(entityName, soulHash, deedDetails);
    }

    function getAllMarks() external view returns (SoulMark[] memory) {
        return registry;
    }
}
