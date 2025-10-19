// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthMediaDAO {
    address public admin;

    struct MediaEntry {
        string youthGroup;
        string mediaType;
        string empowermentTheme;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    MediaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMedia(string memory youthGroup, string memory mediaType, string memory empowermentTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(MediaEntry(youthGroup, mediaType, empowermentTheme, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealMediaEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getMediaEntry(uint256 index) external view returns (MediaEntry memory) {
        return entries[index];
    }
}
