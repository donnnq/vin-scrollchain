// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrFelipeScrollstormCodexDAO {
    address public admin;

    struct Insight {
        string theme;
        string quote;
        string timestamp;
        bool sealed;
    }

    Insight[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInsight(string memory _theme, string memory _quote, string memory _timestamp) external onlyAdmin {
        codex.push(Insight(_theme, _quote, _timestamp, false));
    }

    function sealInsight(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getInsight(uint256 index) external view returns (Insight memory) {
        return codex[index];
    }
}
