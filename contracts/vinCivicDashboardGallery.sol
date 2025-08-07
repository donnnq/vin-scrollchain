// SPDX-License-Identifier: CIVIC-DASHBOARD-GALLERY
pragma solidity ^0.8.19;

contract vinCivicDashboardGallery {
    struct TrialDisplay {
        string respondent;
        string verdict;
        string alignment;
        bool isDivergent;
        bool forgivenessGranted;
        uint timestamp;
    }

    TrialDisplay[] public galleryLog;

    event GalleryEntry(string respondent, string verdict, string alignment, bool isDivergent, bool forgivenessGranted, uint time);

    function logTrial(
        string calldata respondent,
        string calldata verdict,
        string calldata alignment,
        bool divergent,
        bool forgiveness,
        uint timestamp
    ) external {
        galleryLog.push(TrialDisplay(respondent, verdict, alignment, divergent, forgiveness, timestamp));
        emit GalleryEntry(respondent, verdict, alignment, divergent, forgiveness, timestamp);
    }

    function getGalleryCount() external view returns (uint) {
        return galleryLog.length;
    }

    function viewGalleryEntry(uint index) external view returns (TrialDisplay memory) {
        require(index < galleryLog.length, "No scroll here");
        return galleryLog[index];
    }
}
