// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthInvestmentResilienceDAO {
    address public admin;

    struct ResilienceEntry {
        string purokOrBarangay;
        string investmentTheme;
        string resilienceProtocol;
        string emotionalTag;
        bool activated;
    }

    ResilienceEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _purokOrBarangay, string memory _investmentTheme, string memory _resilienceProtocol, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ResilienceEntry(_purokOrBarangay, _investmentTheme, _resilienceProtocol, _emotionalTag, false));
    }

    function activateProtocol(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getProtocol(uint256 index) external view returns (ResilienceEntry memory) {
        return protocols[index];
    }
}
