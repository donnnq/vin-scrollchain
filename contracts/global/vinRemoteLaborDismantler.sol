// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract vinRemoteLaborDismantler {
    struct RelocationEvent {
        string companyName;
        string originCountry;
        string targetCountry;
        uint256 timestamp;
        string reason;
        bool exploitative;
    }

    RelocationEvent[] public flaggedRelocations;

    event RelocationFlagged(string companyName, string targetCountry, bool exploitative);

    function flagRelocation(
        string memory _companyName,
        string memory _originCountry,
        string memory _targetCountry,
        string memory _reason,
        bool _exploitative
    ) public {
        flaggedRelocations.push(RelocationEvent({
            companyName: _companyName,
            originCountry: _originCountry,
            targetCountry: _targetCountry,
            timestamp: block.timestamp,
            reason: _reason,
            exploitative: _exploitative
        }));

        emit RelocationFlagged(_companyName, _targetCountry, _exploitative);
    }

    function getFlaggedRelocations() public view returns (RelocationEvent[] memory) {
        return flaggedRelocations;
    }
}
