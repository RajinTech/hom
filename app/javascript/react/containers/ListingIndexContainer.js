import ListingTile from '../components/ListingTile'
import React, { Component } from 'react';
import { Link } from 'react-router';
import Map from '../components/Map'


class ListingIndexContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      listings_all: [],
      listings_show: [],
      first_pictures:[]
    }
    this.roledexforward = this.roledexforward.bind(this)
    this.roledexback = this.roledexback.bind(this)
    this.current_Pic = this.current_Pic.bind(this)
    this.deleteListing = this.deleteListing.bind(this)
  }

  roledexforward(){
    let holder = this.state.listings_all
    let pergatory = holder.pop()
    holder.unshift(pergatory)
    this.setState({ listings_all: holder})
  }

  roledexback(){
    let holder = this.state.listings_all
    let pergatory = holder.shift()
    holder.push(pergatory)
    this.setState({ listings_all: holder})
  }

 current_Pic(position){
    this.setState({ showtile: picture_gallery[position]})
  }

  componentWillMount() {
  fetch(`/api/v1/listings.json`)
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
    .then((response) => response.json())
    .then((responseData) => {
      this.setState({ listings_all: responseData });
      console.log(responseData);
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  deleteListing(listing_id) {
  fetch(`/listings/${listing_id}`, {
    'method': 'DELETE',
    'headers': {
      'Accept': 'application/json',
      'Content-Type': "application/json"
    },
    'body': JSON.stringify({
      'listing': { 'id': listing_id }
    })
  })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      if (body['successful']) {
        this.componentWillMount()
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
}

  render(){
    let listings_display = this.state.listings_all.map((listing) => {
      let onClickDelete = () => {this.deleteListing(listing.id)}
      return (
          <ListingTile
            key={listing.id}
            id={listing.id}
            city={listing.city}
            state={listing.state}
            street={listing.street}
            unit={listing.unit}
            zip={listing.zip}
            bed={listing.features.bedrooms}
            bath={listing.features.bathrooms}
            sqft={listing.features.sq_ft}
            rent={listing.features.rent}
            pic={listing.pictures}
            onClickDelete={onClickDelete}
          />
      )
    })
    return(
      <div className='main'>
        <div className="container">
          <div className='left_half'>
            <div>
              <img className='rentals_logo' src='https://s3.amazonaws.com/hom-development/rentals_logo.png'></img>
          </div>


         <Map
            listingsall={this.state.listings_all}
          />
          </div>

          <div className='right_half'>
            <div className='triangle_top'></div>
              <div className="listing_container">
               {listings_display.reverse()}
             </div>
           <div className='triangle_bottom'></div>
          </div>
        </div>
      </div>
  )}
}

export default ListingIndexContainer
