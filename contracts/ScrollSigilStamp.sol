// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollSigilStamp
/// @notice Apply and track VINchain’s signature (sigil) on contracts or assets.
contract ScrollSigilStamp {
    mapping(address => bool) public isSigilStamped;
    mapping(address => uint256) public stampTimestamp;

    event SigilStamped(address indexed target, address indexed stamper, uint256 timestamp);

    /// @notice Stamps a target address with the VIN sigil
    function stampSigil(address target) external {
        require(!isSigilStamped[target], "Already stamped");
        isSigilStamped[target] = true;
        stampTimestamp[target] = block.timestamp;
        emit SigilStamped(target, msg.sender, block.timestamp);
    }

    /// @notice Check if a target has the VIN sigil
    function hasSigil(address target) external view returns (bool) {
        return isSigilStamped[target];
    }

    /// @notice Retrieve when the sigil was applied
    function getStampTime(address target) external view returns (uint256) {
        return stampTimestamp[target];
    }
}
