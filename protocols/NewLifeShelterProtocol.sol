// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NewLifeShelterProtocol {
    address public steward;

    struct ApplicantStory {
        string name;
        string role; // "Kasambahay", "Housewife", "Solo earner", "Family of 3"
        string experience; // "Walang bahay", "Nag-iisa", "Gusto ng bagong trabaho"
        string emotionalTag;
        bool wantsNewWork;
        bool approvedForHousing;
        bool sealed;
    }

    ApplicantStory[] public stories;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function submitStory(string memory name, string memory role, string memory experience, string memory emotionalTag, bool wantsNewWork) external onlySteward {
        stories.push(ApplicantStory(name, role, experience, emotionalTag, wantsNewWork, true, false));
    }

    function sealStory(uint256 index) external onlySteward {
        require(stories[index].approvedForHousing, "Must be approved first");
        stories[index].sealed = true;
    }

    function getStory(uint256 index) external view returns (ApplicantStory memory) {
        return stories[index];
    }
}
