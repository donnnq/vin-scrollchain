// vinShelterBlessing.sol

contract vinShelterBlessing {
    mapping(address => bool) public shelterApproved;
    event ShelterGranted(address family);

    function blessShelter(address _family) public {
        shelterApproved[_family] = true;
        emit ShelterGranted(_family);
    }
}
