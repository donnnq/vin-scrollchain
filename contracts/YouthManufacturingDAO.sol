// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthManufacturingDAO {
    address public admin;

    struct YouthEntry {
        string name;
        string skillTrack;
        string manufacturingSector;
        string emotionalTag;
        bool onboarded;
    }

    YouthEntry[] public youth;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function onboardYouth(string memory _name, string memory _skillTrack, string memory _manufacturingSector, string memory _emotionalTag) external onlyAdmin {
        youth.push(YouthEntry(_name, _skillTrack, _manufacturingSector, _emotionalTag, false));
    }

    function certifyYouth(uint256 index) external onlyAdmin {
        youth[index].onboarded = true;
    }

    function getYouth(uint256 index) external view returns (YouthEntry memory) {
        return youth[index];
    }
}
