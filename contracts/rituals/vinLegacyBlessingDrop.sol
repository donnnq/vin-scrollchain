// SPDX-License-Identifier: VIN-LegacyBlessing
pragma solidity ^0.8.19;

contract vinLegacyBlessingDrop {
    address public vinvinSoul;
    string public scrollchainOrigin;
    string[] public blessings;
    uint256 public totalBlessings;

    event BlessingDropped(string message, uint256 timestamp);
    event BlessingFinalized(string summary);

    modifier onlyVINVIN() {
        require(msg.sender == vinvinSoul, "Access denied: VINVIN only");
        _;
    }

    constructor(string memory originMessage) {
        vinvinSoul = msg.sender;
        scrollchainOrigin = originMessage;
        totalBlessings = 0;
    }

    function dropBlessing(string memory message) external onlyVINVIN {
        blessings.push(message);
        totalBlessings += 1;
        emit BlessingDropped(message, block.timestamp);
    }

    function finalizeBlessings(string memory summaryMessage) external onlyVINVIN {
        emit BlessingFinalized(summaryMessage);
    }

    function viewBlessing(uint256 index) external view returns (string memory) {
        return blessings[index];
    }

    function getBlessingStats() external view returns (uint256, string memory) {
        return (totalBlessings, scrollchainOrigin);
    }
}
