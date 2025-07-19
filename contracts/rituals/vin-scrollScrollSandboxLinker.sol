// SPDX-License-Identifier: VINVINverseTeleport
pragma solidity ^0.8.0;

contract ScrollSandboxLinker {
    address public scrollmaster;

    struct LinkedAsset {
        string moduleName;
        string gameVerse;
        string assetType;
        string integrationNotes;
        uint256 linkTimestamp;
    }

    LinkedAsset[] public assetLog;

    event AssetLinked(string module, string gameVerse, string assetType, string notes, uint256 timestamp);

    constructor() {
        scrollmaster = msg.sender;
    }

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN can link the scroll dimension.");
        _;
    }

    function linkAsset(string memory moduleName, string memory gameVerse, string memory assetType, string memory integrationNotes) external onlyMaster {
        assetLog.push(LinkedAsset(moduleName, gameVerse, assetType, integrationNotes, block.timestamp));
        emit AssetLinked(moduleName, gameVerse, assetType, integrationNotes, block.timestamp);
    }

    function getAsset(uint index) external view returns (string memory, string memory, string memory, string memory, uint256) {
        LinkedAsset memory a = assetLog[index];
        return (a.moduleName, a.gameVerse, a.assetType, a.integrationNotes, a.linkTimestamp);
    }

    function totalLinks() external view returns (uint) {
        return assetLog.length;
    }
}
