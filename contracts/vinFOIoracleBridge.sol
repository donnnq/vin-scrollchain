// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface OracleFeed {
    function fetchFOIData(string calldata agency, string calldata infoType) external view returns (string memory);
}

contract vinFOIoracleBridge {
    address public scrollKeeper;
    OracleFeed public oracleSource;

    struct InfoDrop {
        string agency;
        string infoType;
        string dataHash; // Can be IPFS CID or content hash
        uint256 timestamp;
        address validator;
    }

    InfoDrop[] public infoDrops;

    event InfoReleased(string agency, string infoType, string dataHash, address validator);

    constructor(address oracleAddress) {
        scrollKeeper = msg.sender;
        oracleSource = OracleFeed(oracleAddress);
    }

    function pullInfo(string calldata agency, string calldata infoType) external {
        string memory fetchedData = oracleSource.fetchFOIData(agency, infoType);
        string memory hashed = string(abi.encodePacked(fetchedData)); // symbolic hashing
        infoDrops.push(InfoDrop(agency, infoType, hashed, block.timestamp, msg.sender));
        emit InfoReleased(agency, infoType, hashed, msg.sender);
    }

    function getDrop(uint256 index) external view returns (InfoDrop memory) {
        return infoDrops[index];
    }

    function totalDrops() external view returns (uint256) {
        return infoDrops.length;
    }
}
