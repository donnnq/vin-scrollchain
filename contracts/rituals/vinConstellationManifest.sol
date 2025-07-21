// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinConstellationManifest
/// @notice Final registry of deployed scrolls, their purpose, version, and interconnected relations
/// @author VINVIN

contract vinConstellationManifest {
    event ScrollRegistered(
        string name,
        string category,
        address indexed scrollAddress,
        string version,
        string ritualBinding,
        uint256 timestamp
    );

    struct ScrollMeta {
        string name;
        string category;
        address scrollAddress;
        string version;
        string ritualBinding;
        uint256 timestamp;
    }

    ScrollMeta[] public constellation;

    function registerScroll(
        string calldata name,
        string calldata category,
        address scrollAddress,
        string calldata version,
        string calldata ritualBinding
    ) external {
        constellation.push(ScrollMeta({
            name: name,
            category: category,
            scrollAddress: scrollAddress,
            version: version,
            ritualBinding: ritualBinding,
            timestamp: block.timestamp
        }));

        emit ScrollRegistered(name, category, scrollAddress, version, ritualBinding, block.timestamp);
    }

    function getScrollCount() external view returns (uint256) {
        return constellation.length;
    }

    function getScrollAt(uint256 index) external view returns (
        string memory name,
        string memory category,
        address scrollAddress,
        string memory version,
        string memory ritualBinding,
        uint256 timestamp
    ) {
        ScrollMeta memory s = constellation[index];
        return (s.name, s.category, s.scrollAddress, s.version, s.ritualBinding, s.timestamp);
    }
}
