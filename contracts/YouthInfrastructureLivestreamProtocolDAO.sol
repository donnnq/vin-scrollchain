// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthInfrastructureLivestreamProtocolDAO {
    address public admin;

    struct LivestreamEntry {
        string projectName;
        string purokOrBarangay;
        string platform;
        string emotionalTag;
        bool broadcasted;
    }

    LivestreamEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleLivestream(string memory _projectName, string memory _purokOrBarangay, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        protocols.push(LivestreamEntry(_projectName, _purokOrBarangay, _platform, _emotionalTag, false));
    }

    function markBroadcasted(uint256 index) external onlyAdmin {
        protocols[index].broadcasted = true;
    }

    function getLivestream(uint256 index) external view returns (LivestreamEntry memory) {
        return protocols[index];
    }
}
