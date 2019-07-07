
import { Route, Switch } from 'react-router-dom';

import React from 'react';
import Home from './Home';
import Posts from './Posts';
import NewPost from './NewPost';

class App extends React.Component {
  render() {
    return (
      <div>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/posts" component={Posts} />
          <Route exact path="/newpost" component={NewPost} />
        </Switch>
      </div>
    )
  }
}

export default App;