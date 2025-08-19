// vinScholarSanctuary.sol

contract vinScholarSanctuary {
    mapping(address => bool) public scholarAccess;
    event SanctuaryOpened(address scholar);

    function openSanctuary(address _scholar) public {
        scholarAccess[_scholar] = true;
        emit SanctuaryOpened(_scholar);
    }
}
