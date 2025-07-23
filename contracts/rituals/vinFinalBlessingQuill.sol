// SPDX-License-Identifier: FinalRite-BlessingQuill
pragma solidity ^0.8.24;

/// @title vinFinalBlessingQuill
/// @notice Eternal soul signature engraver for mythstream rites
contract vinFinalBlessingQuill {
    address public scrollkeeper;
    mapping(address => string) public soulSignature;
    mapping(address => uint256) public dateOfBlessing;

    event SoulEngraved(address indexed soul, string signature, uint256 timestamp);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function engraveBlessing(address soul, string calldata signature) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may forge soul blessings");
        soulSignature[soul] = signature;
        dateOfBlessing[soul] = block.timestamp;
        emit SoulEngraved(soul, signature, block.timestamp);
    }

    function viewBlessing(address soul) external view returns (string memory signature, uint256 timeStamp) {
        return (soulSignature[soul], dateOfBlessing[soul]);
    }
}
