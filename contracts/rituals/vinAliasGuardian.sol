// Protects alias store from path traversal attacks via input validation and event logs
contract vinAliasGuardian {
    event AliasAccessAttempt(string aliasInput, bool safe, uint256 timestamp);

    function validateAlias(string memory aliasInput) public returns (bool) {
        bool isSafe = !containsTraversal(aliasInput);
        emit AliasAccessAttempt(aliasInput, isSafe, block.timestamp);
        return isSafe;
    }

    function containsTraversal(string memory input) internal pure returns (bool) {
        bytes memory str = bytes(input);
        for (uint i = 0; i < str.length - 2; i++) {
            if (str[i] == '.' && str[i+1] == '.' && str[i+2] == '/') return true;
        }
        return false;
    }
}
