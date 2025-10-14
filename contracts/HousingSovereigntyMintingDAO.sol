// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HousingSovereigntyMintingDAO {
    address public admin;

    struct SovereigntyToken {
        address recipient;
        string category;
        bool minted;
    }

    SovereigntyToken[] public tokens;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mintToken(address _recipient, string memory _category) external onlyAdmin {
        tokens.push(SovereigntyToken(_recipient, _category, true));
    }

    function getToken(uint256 index) external view returns (SovereigntyToken memory) {
        return tokens[index];
    }
}
