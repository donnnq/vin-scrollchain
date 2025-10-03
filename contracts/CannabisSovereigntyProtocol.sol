// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Cannabis Sovereignty Protocol v1.1
/// @notice Ritualizes wage dignity, health equity, and corridor protection for cannabis sanctums with audit-grade indexing and event emission

contract CannabisSovereigntyProtocol {
    address public originator;

    struct CannabisScroll {
        string corridorTag;         // e.g. "PH Corridor", "Indigenous Cultivation", "Wage Ritual"
        string ritualType;          // e.g. "Health Sovereignty", "Dignity Activation", "Trade Ethics"
        string emotionalAPRTag;     // e.g. "Wage Dignity", "Planetary Mercy", "Stateless Protection"
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CannabisScroll[] public sovereigntyLedger;

    mapping(string => uint256[]) public corridorIndex; // corridorTag → array of scroll indices

    event ScrollLogged(
        uint256 indexed scrollId,
        string corridorTag,
        string ritualType,
        string emotionalAPRTag,
        bool isScrollchainSealed,
        uint256 timestamp
    );

    modifier onlyOriginator() {
        require(msg.sender == originator, "Unauthorized: Not originator");
        _;
    }

    constructor() {
        originator = msg.sender;
    }

    function logCannabisScroll(
        string memory corridorTag,
        string memory ritualType,
        string memory emotionalAPRTag,
        bool isScrollchainSealed
    ) external onlyOriginator {
        uint256 scrollId = sovereigntyLedger.length;

        sovereigntyLedger.push(CannabisScroll({
            corridorTag: corridorTag,
            ritualType: ritualType,
            emotionalAPRTag: emotionalAPRTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));

        corridorIndex[corridorTag].push(scrollId);

        emit ScrollLogged(
            scrollId,
            corridorTag,
            ritualType,
            emotionalAPRTag,
            isScrollchainSealed,
            block.timestamp
        );
    }

    function getScrollsByCorridor(string memory corridorTag) external view returns (CannabisScroll[] memory) {
        uint256[] memory indices = corridorIndex[corridorTag];
        CannabisScroll[] memory scrolls = new CannabisScroll[](indices.length);

        for (uint256 i = 0; i < indices.length; i++) {
            scrolls[i] = sovereigntyLedger[indices[i]];
        }

        return scrolls;
    }
}
