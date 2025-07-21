// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinMythstreamDeployer
/// @notice Master scroll registry for deploying, linking, and activating interconnected smart contract rituals
/// @author VINVIN

contract vinMythstreamDeployer {
    event ScrollLinked(string scrollName, address indexed scrollAddress, uint256 timestamp);
    event ScrollActivated(string ritual, address indexed scroll, string activationDetails, uint256 timestamp);
    event MythstreamComposed(address[] scrolls, string constellationName, uint256 timestamp);

    struct Scroll {
        string name;
        address contractAddress;
        uint256 linkedAt;
    }

    Scroll[] public linkedScrolls;

    function linkScroll(string calldata scrollName, address scrollAddress) external {
        linkedScrolls.push(Scroll({
            name: scrollName,
            contractAddress: scrollAddress,
            linkedAt: block.timestamp
        }));
        emit ScrollLinked(scrollName, scrollAddress, block.timestamp);
    }

    function activateScroll(
        string calldata ritual,
        address scroll,
        string calldata activationDetails
    ) external {
        emit ScrollActivated(ritual, scroll, activationDetails, block.timestamp);
    }

    function composeMythstream(string calldata constellationName) external {
        address[] memory scrolls = new address[](linkedScrolls.length);
        for (uint256 i = 0; i < linkedScrolls.length; i++) {
            scrolls[i] = linkedScrolls[i].contractAddress;
        }
        emit MythstreamComposed(scrolls, constellationName, block.timestamp);
    }

    function getLinkedScrollCount() external view returns (uint256) {
        return linkedScrolls.length;
    }

    function getScrollAt(uint256 index) external view returns (
        string memory name,
        address contractAddress,
        uint256 linkedAt
    ) {
        Scroll memory s = linkedScrolls[index];
        return (s.name, s.contractAddress, s.linkedAt);
    }
}
