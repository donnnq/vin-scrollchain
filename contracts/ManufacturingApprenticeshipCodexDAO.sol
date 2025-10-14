// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManufacturingApprenticeshipCodexDAO {
    address public admin;

    struct ApprenticeshipEntry {
        string apprenticeName;
        string barangay;
        string skillTrack;
        string emotionalTag;
        bool certified;
    }

    ApprenticeshipEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerApprentice(string memory _apprenticeName, string memory _barangay, string memory _skillTrack, string memory _emotionalTag) external onlyAdmin {
        codex.push(AppreciateshipEntry(_apprenticeName, _barangay, _skillTrack, _emotionalTag, false));
    }

    function certifyApprentice(uint256 index) external onlyAdmin {
        codex[index].certified = true;
    }

    function getApprentice(uint256 index) external view returns (ApprenticeshipEntry memory) {
        return codex[index];
    }
}
