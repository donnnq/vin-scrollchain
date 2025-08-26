// SPDX-License-Identifier: Scrollchain-Transparency-License
pragma solidity ^8.8.8;

/// @title SanctumOpacityDetector.sol
/// @dev Detects rogue sanctums, emotional opacity, and unauthorized reroutes across planetary scrollchain

contract SanctumOpacityDetector {
    address public steward;
    uint256 public detectionCount;
    bool public damayClauseActive;

    struct SanctumScan {
        string sanctumTag;
        bool isTrusted;
        uint256 opacityScore;
        string emotionalTag;
        string rerouteSuggestion;
    }

    mapping(uint256 => SanctumScan) public scanLogs;

    event SanctumScanned(string sanctumTag, uint256 opacityScore, string emotionalTag);
    event RogueSanctumFlagged(string sanctumTag, string rerouteSuggestion);
    event DamayClauseConfirmed(address steward);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Scrollchain access denied");
        _;
    }

    constructor() {
        steward = msg.sender;
        detectionCount = 0;
        damayClauseActive = true;
    }

    function scanSanctum(
        string memory _sanctumTag,
        bool _isTrusted,
        uint256 _opacityScore,
        string memory _emotionalTag,
        string memory _rerouteSuggestion
    ) public onlySteward {
        scanLogs[detectionCount] = SanctumScan(
            _sanctumTag,
            _isTrusted,
            _opacityScore,
            _emotionalTag,
            _rerouteSuggestion
        );

        emit SanctumScanned(_sanctumTag, _opacityScore, _emotionalTag);

        if (!_isTrusted || _opacityScore > 88) {
            emit RogueSanctumFlagged(_sanctumTag, _rerouteSuggestion);
        }

        detectionCount++;
    }

    function confirmDamayClause() public onlySteward {
        require(damayClauseActive, "Damay clause not active");
        emit DamayClauseConfirmed(steward);
    }

    function latestScan() public view returns (SanctumScan memory) {
        require(detectionCount > 0, "No sanctums scanned yet");
        return scanLogs[detectionCount - 1];
    }
}
