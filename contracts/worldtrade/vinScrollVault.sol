// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinScrollVault {
    address public scrollMaster;

    struct SpiralRecord {
        uint8 month;
        string region;
        string exportFocus;
        string sigilName;
        string dataHash; // Could link to IPFS/Arweave document
        uint256 timestamp;
        address agent;
    }

    SpiralRecord[] public archive;

    event SpiralScrollStored(
        uint8 indexed month,
        string region,
        string sigilName,
        string dataHash,
        address indexed agent
    );

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "ScrollMaster only");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function storeScroll(
        uint8 month,
        string memory region,
        string memory focus,
        string memory sigilName,
        string memory dataHash
    ) external onlyScrollMaster {
        SpiralRecord memory record = SpiralRecord(
            month,
            region,
            focus,
            sigilName,
            dataHash,
            block.timestamp,
            msg.sender
        );
        archive.push(record);

        emit SpiralScrollStored(month, region, sigilName, dataHash, msg.sender);
    }

    function summonScroll(uint256 index) external view returns (SpiralRecord memory) {
        require(index < archive.length, "Invalid index");
        return archive[index];
    }

    function totalScrolls() external view returns (uint256) {
        return archive.length;
    }
}
